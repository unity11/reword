using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class SceneShot : MonoBehaviour
{
    public RawImage pickture;

    public float capx;
    public float capy;


    public float capwidth;

    public float capheight;


    public RectTransform canval;
    public Material mat;

    public Texture tex;
    public Texture tex1;
    public ParticleSystem particle;
    public ParticleSystem particle1;
    public float effectTime;

    public ParticleSystem particleSystem;
    // Start is called before the first frame update
    void Start()
    {
        
        //mat.SetTexture("main_texture", tex);
        particle.GetComponent<Renderer>().material.SetTexture("_main_texture", tex);

        particle1.GetComponent<ParticleSystemRenderer>().trailMaterial.SetTexture("_main_texture", tex);
        //pos1 = Camera.main.WorldToScreenPoint(photo.transform.Find("Point1").position);
        //pos2 = Camera.main.WorldToScreenPoint(photo.transform.Find("Point2").position);
        //capx = pos1.x;
        //capy = pos1.y;
        //capwidth = Mathf.RoundToInt(pos2.x - pos1.x);
        //capheight = Mathf.RoundToInt(pos2.y - pos1.y);

        //Debug.LogError(Screen.width);
        //Debug.LogError(Screen.height);
        particleSystem.Play();
    }

    // Update is called once per frame
    void Update()
    {
        //particleSystem.Simulate(effectTime, true);
        if (Input.GetKeyDown(KeyCode.S))
        {
            StartShot();
        }

        if (Input.GetKeyDown(KeyCode.D))
        {
            //Vector2 pos = Vector2.zero;
            //RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, photo.GetComponent<RectTransform>().anchoredPosition, Camera.main, out pos);
            //Debug.LogError(pos);

            screncePos = Camera.main.WorldToScreenPoint(pickture.transform.position);
            Debug.LogError(pickture.GetComponent<RectTransform>().rect);
        }

    }

    public Vector3 screncePos;
    public Vector2 pos1;
    public Vector2 pos2;

    public void StartShot()
    {
        pos1 = Camera.main.WorldToScreenPoint(pickture.transform.Find("Point1").position);
        pos2 = Camera.main.WorldToScreenPoint(pickture.transform.Find("Point2").position);

        //全部取整数防止有一个像素的偏差
        pos1.x = Mathf.RoundToInt(pos1.x);
        pos1.y = Mathf.RoundToInt(pos1.y);

        pos2.x = Mathf.RoundToInt(pos2.x);
        pos2.y = Mathf.RoundToInt(pos2.y);

        capwidth = (pos2.x - pos1.x);
        capheight = (pos2.y - pos1.y);

        float x = capwidth - (int)capwidth;
        float y = capheight - (int)capheight;

        capx = (pos1.x);
        capy = (pos1.y);


        Vector2 position;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos1 + (pos2-pos1)/2, canval.GetComponent<Canvas>().worldCamera, out position);
        RectTransform r = pickture.GetComponent<RectTransform>();
        Debug.LogError(position);
        r.localPosition = position;



        Vector2 position1;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos1, Camera.main, out position1);
        Vector2 position2;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos2, Camera.main, out position2);

        r.sizeDelta = new Vector2(position2.x - position1.x, position2.y - position1.y);

        Debug.LogError(r.sizeDelta);


        //Debug.LogError("capx:" + capx + " capy:" + capy);
        //Debug.LogError("x:" + x + " y:" + y);
        //Debug.LogError("capwidth:" + capwidth + " capheight:" + capheight);
        StartCoroutine(getScreenTexture());
    }

    public void StartShot1()
    {
        pos1 = Camera.main.WorldToScreenPoint(pickture.transform.Find("Point1").position);
        pos2 = Camera.main.WorldToScreenPoint(pickture.transform.Find("Point2").position);

        pos1.x = Mathf.RoundToInt(pos1.x);
        pos1.y = Mathf.RoundToInt(pos1.y);

        pos2.x = Mathf.RoundToInt(pos2.x);
        pos2.y = Mathf.RoundToInt(pos2.y);

        capwidth = (pos2.x - pos1.x);
        capheight = (pos2.y - pos1.y);

        float x = capwidth - (int)capwidth;
        float y = capheight - (int)capheight;

        capx = (pos1.x);
        capy = (pos1.y);


        Vector2 position;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos1, canval.GetComponent<Canvas>().worldCamera, out position);
        RectTransform r = pickture.GetComponent<RectTransform>();
        Debug.LogError(position);
        //r.anchoredPosition = position;

       

        Vector2 position1;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos1, Camera.main, out position1);
        Vector2 position2;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(canval, pos2, Camera.main, out position2);

        r.sizeDelta = new Vector2(position2.x - position1.x, position2.y - position1.y);

        Debug.LogError(r.sizeDelta);

        //Debug.LogError("capx:" + capx + " capy:" + capy);
        //Debug.LogError("x:" + x + " y:" + y);
        //Debug.LogError("capwidth:" + capwidth + " capheight:" + capheight);
        StartCoroutine(getScreenTexture());
    }


    IEnumerator getScreenTexture()
    {

        yield return new WaitForEndOfFrame();
        //需要正确设置好图片保存格式
        float x = pickture.GetComponent<RectTransform>().sizeDelta.x;
        float y = pickture.GetComponent<RectTransform>().sizeDelta.y;
        Texture2D t = new Texture2D((int)capwidth, (int)capheight, TextureFormat.RGBA32, true);
       
        //按照设定区域读取像素；注意是以左下角为原点读取

        t.ReadPixels(new Rect(capx, capy, capwidth, capheight), 0, 0, false);
        t.Apply();

        pickture.texture = t;
        pickture.gameObject.SetActive(true);
    }



}
