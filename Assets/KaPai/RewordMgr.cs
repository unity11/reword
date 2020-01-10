using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.Networking;

public enum State
{
    None,
    Get,
    Show,
    Wait,
}
public enum RewordType
{
    cash,   //现金奖
    sixth,  //六等奖
    fifth,  //五等奖
    fourth, //四等奖
    third,  //三等奖
    second, //二等奖
    first,  //一等奖
    special,//特等奖

}

public class VideoType
{
    public static int Start=0;
    public static int FiveOut=1;
    public static int FiveDisappear=2;
    public static int OneOut=3;
    public static int OneDisappear=4;
    public static int Loop = 5;
}

[Serializable]
public class RewordInfo
{
    public Vector3 pos;
    public Texture tex;
}



public class RewordMgr : MonoBehaviour
{

    public string url= "http://192.168.21.81:8080/lottery.php?type=";

    public BtnController BtnCtl;
    public VideoController VideoCtl;
    public GameObject photoonePre;
    public GameObject photofivePre;
    public RectTransform parent;
    public Material baseFireMaterial;
    public RectTransform canval;

    public RewordInfo OneRewordInfo;
    public List<RewordInfo> rewordInfoList;

    public Response response;
    List<Photo> photos = new List<Photo>();

    public RewordType rewordType;

    private State state= State.None;

    private State RewordState
    {
        get { return state; }
        set
        {
            state = value;
            Debug.LogError(state);
        }
    }
    public int index;
    void Start()
    {
        BtnCtl.Init(this);
        string[] arguments = Environment.GetCommandLineArgs();
        if (arguments.Length>1)
        {
            url = arguments[1];
        }
    }


    void Update()
    {

        if (Input.GetKeyDown(KeyCode.Q) && Input.GetKey(KeyCode.LeftControl))
        {
            Application.Quit();
        }

        if (VideoCtl.ScenceVideo.clip.name!="loop")
        {
            if (Input.GetKeyDown(KeyCode.Space)&&RewordState==State.Get) 
            {
                RewordState = State.Wait;
                StartCoroutine(Get());
            }

            if (Input.GetKeyDown(KeyCode.Return) && RewordState == State.Show)
            {
                StartShowPhoto();
            }

            if (Input.GetKeyDown(KeyCode.Backspace))
            {
                RewordState = State.None;
                OnDisappear(delegate {
                    BtnCtl.gameObject.SetActive(true);
                    StartCoroutine(VideoCtl.RewordOnce(null, 0, -1, VideoType.Loop));
                });
            }
        }

  
 
    }

    //设置新的抽奖类型
    public void SetNewReword(RewordType type)
    {
        RewordState = State.Get;
        this.rewordType = type;
        OnRewordTypeChanged();
    }
    private void OnRewordTypeChanged()
    {
        BtnCtl.gameObject.SetActive(false);
        StartCoroutine(VideoCtl.RewordOnce(delegate
        {
            //StartCoroutine(Get());
        }, 0, -1, VideoType.Start));
    }
    /// <summary>
    /// 卡片消失
    /// </summary>
    public void OnCardDisappear(int type,Action action)
    {
        StartCoroutine(VideoCtl.RewordOnce(action, 0, -1, type));
    }

    private Photo CreatePhoto(GameObject prefab, RewordInfo rewordInfo, RewordWebInfo rewordWeb)
    {
        GameObject obj = GameObject.Instantiate<GameObject>(prefab, parent);
        obj.name = index.ToString();
        Photo photo = obj.GetComponent<Photo>();
        photo.Init(baseFireMaterial, rewordInfo, rewordWeb);
        StartShot(photo);
        photos.Add(photo);
        index++;
        return photo;
    }

    public void RewordPerson()
    {
        RewordPerson(response.data.Length == 1 ? VideoType.OneOut : VideoType.FiveOut);
    }
    /// <summary>
    /// 抽奖
    /// </summary>
    /// <param name="type"></param>
    private void RewordPerson(int type)
    {
        StartCoroutine(VideoCtl.RewordOnce(delegate
        {
            RewordState = State.Show;
            //StartShowPhoto();
        }, 0f, -1, type));
    }

    //开始展示当前抽奖结果
    public void StartShowPhoto()
    {
        if (response != null && response.data != null&&!response.IsShow)
        {
            response.IsShow = true;
            if (response.data.Length == 1)
            {
                CreatePhoto(photoonePre, OneRewordInfo, response.data[0]);
            }
            else
            {
                for (int i = 0; i < response.data.Length; i++)
                {
                    CreatePhoto(photofivePre, rewordInfoList[i], response.data[i]);
                }
            }
            StartCoroutine(getScreenTexture(photos, delegate
            {
                photos[0].rewindParticle.PlayForword(delegate {
                    RewordState = State.Get;
                });
                for (int i = 1; i < photos.Count; i++)
                {
                    photos[i].rewindParticle.PlayForword(null);
                }
            }));
        }
    }

    public void ShowReword()
    {
        OnDisappear(RewordPerson);
    }

    //在图片消失后回调
    private void OnDisappear(Action action)
    {
        if (photos.Count > 0)
        {
            photos[0].PlayBack(delegate
            {
                int type = photos.Count == 1 ? VideoType.OneDisappear : VideoType.FiveDisappear;

                for (int i = 0; i < photos.Count; i++)
                {
                    GameObject.Destroy(photos[i].gameObject);
                }
                photos.Clear();
                OnCardDisappear(type, action);
            });
            for (int i = 1; i < photos.Count; i++)
            {
                photos[i].PlayBack(null);
            }
        }
        else
        {
            action();
        }
    }




    IEnumerator Get()
    {
        UnityWebRequest webRequest = UnityWebRequest.Get(url+rewordType.ToString());
        yield return webRequest.SendWebRequest();
        if (webRequest.isHttpError || webRequest.isNetworkError)
        {
            //请求不成功,设置状态为可请求
            Debug.Log(webRequest.error);
            RewordState = State.Get;
        }
        else
        {
            Debug.Log(webRequest.downloadHandler.text);
            response = JsonUtility.FromJson<Response>(webRequest.downloadHandler.text);
            response.IsShow = false;
            ShowReword();
        }
    }

    public void StartShot(Photo photo)
    {
        Vector2 pos1 = Camera.main.WorldToScreenPoint(photo.pickture.transform.Find("Point1").position);
        Vector2 pos2 = Camera.main.WorldToScreenPoint(photo.pickture.transform.Find("Point2").position);

        //全部取整数防止有一个像素的偏差
        pos1.x = Mathf.RoundToInt(pos1.x);
        pos1.y = Mathf.RoundToInt(pos1.y);

        pos2.x = Mathf.RoundToInt(pos2.x);
        pos2.y = Mathf.RoundToInt(pos2.y);

        float capwidth = (pos2.x - pos1.x);
        float capheight = (pos2.y - pos1.y);

        float x = capwidth - (int)capwidth;
        float y = capheight - (int)capheight;

        float capx = (pos1.x);
        float capy = (pos1.y);


        Vector2 position;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos1 + (pos2 - pos1) / 2, canval.GetComponent<Canvas>().worldCamera, out position);
        RectTransform r = photo.pickture.GetComponent<RectTransform>();

        r.localPosition = position;
        Vector2 position1;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos1, Camera.main, out position1);
        Vector2 position2;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos2, Camera.main, out position2);

        r.sizeDelta = new Vector2(position2.x - position1.x, position2.y - position1.y);

        //Debug.LogError(r.sizeDelta);
        photo.SetSize(capx, capy, capwidth, capheight);
       
    }


    IEnumerator getScreenTexture(List<Photo> photoList,Action callBack)
    {

        yield return new WaitForEndOfFrame();
        for (int i = 0; i < photoList.Count; i++)
        {
            Photo photo = photoList[i];
            //需要正确设置好图片保存格式
            float x = photo.pickture.GetComponent<RectTransform>().sizeDelta.x;
            float y = photo.pickture.GetComponent<RectTransform>().sizeDelta.y;
            Texture2D t = new Texture2D((int)photo.capwidth, (int)photo.capheight, TextureFormat.RGBA32, true);

            //按照设定区域读取像素；注意是以左下角为原点读取

            t.ReadPixels(new Rect(photo.capx, photo.capy, photo.capwidth, photo.capheight), 0, 0, false);
            t.Apply();

            photo.SetBgTex(t);
            photo.obj.SetActive(true);
        }
        if (callBack!=null)
        {
            callBack();
        }
    }
}


[System.Serializable]
public class Response{
    public int code;

    public string msg;

    public RewordWebInfo[] data;

    public bool IsShow = false;
}
[System.Serializable]
public class RewordWebInfo
{
    public string id;
    public string name;
    public string department;
    public string image;
    public string status;
    public string is_formal;
    public string special;
    public string first;
    public string second;
    public string third;
    public string fourth;
    public string fifth;
    public string sixth;
    public string cash;
    public string create_time;
    public string update_time;
}