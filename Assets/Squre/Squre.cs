
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class Squre : MonoBehaviour
{
    public Transform parent;
    public GameObject Picture;
    public int Num=500;
    public float Radius=15;

    public List<GameObject> objList = new List<GameObject>();
    public int raw;
    public int line;
    public Vector2 offset;

    Vector3 startPos;

    private Transform camera;
    public Transform centerPos;
    public Role role;

    private List<Role> rewardRoles = new List<Role>();

    public Transform[] PosGroup;
    private int posIndex = 0;



    public int PosIndex
    {
        get { return posIndex; }
        set
        {
            posIndex = value;
            posIndex = posIndex >= PosGroup.Length ? 0:posIndex;
            posIndex = posIndex < 0 ? PosGroup.Length - 1 : posIndex;
        }
    }





    public float time;
    void Start()
    {
        camera = this.transform;
        for (int i = 0; i < Num; i++)
        {
            GameObject obj = GameObject.Instantiate<GameObject>(Picture, parent);
            obj.transform.GetChild(0).GetComponent<TextMesh>().text = i.ToString();
            obj.SetActive(true);
            objList.Add(obj);
        }
    }

    public void Show0()
    {
        
        startPos = Vector2.zero;
        line = Mathf.CeilToInt(((float)Num) / raw);
        startPos.x -= (raw * offset.x / 2);
        startPos.y += (line * offset.y / 2);
        for (int i=0;i<objList.Count;i++)
        {
            int x = i % raw;
            int y = i / raw;
            Vector3 pos =new Vector3(startPos.x + x * offset.x, startPos.y-y*offset.y) ;
           
            objList[i].transform.DOMove(pos, GetRadTime());
            
            objList[i].transform.DORotateQuaternion(Quaternion.identity, GetRadTime());
        }
    }

    public float GetRadTime()
    {
        return Random.Range(time - 0.4f, time + 0.4f);
    }

    public void Show1()
    {
        CreatPointOnSphere(Num, Radius);
    }

    public void CreatPointOnSphere(int _wBornPointSum, float _dwDectRadius)
    {
        int tempIndex = 0;
        //生成
        float inc = Mathf.PI * (3.0f - Mathf.Sqrt(5.0f));
        float off = 2.0f / _wBornPointSum;   //注意保持数值精度  m_wBornPointSum：生成的点数
        float y;
        float r;
        float phi;
        for (int i = 0; i < _wBornPointSum; i++)
        {
            y = (float)i * off + (off / 2.0f) - 1.0f;
            r = Mathf.Sqrt(1.0f - y * y);
            phi = i * inc;
            Vector3 pos = new Vector3(Mathf.Cos(phi) * r * _dwDectRadius, y * _dwDectRadius, Mathf.Sin(phi) * r * _dwDectRadius); //m_dwDectRadius  距离球心的距离
            tempIndex++;
            BornPoint(objList[i], pos, 0);
  

        }
    }

    void BornPoint(GameObject obj, Vector3 pos, int tempIndex)
    {
        obj.transform.DOMove(pos, GetRadTime());
        Vector3 v = pos.normalized;
        v.z = 0;
        obj.transform.DORotateQuaternion(Quaternion.LookRotation(pos), GetRadTime());
    }


    private void Update()
    {

        if (Input.GetKeyDown(KeyCode.D))
        {
            int index = Random.Range(0, objList.Count);
            role.transform = objList[index].transform;
            role.center = this.parent;
            role.camera = this.transform;
            role.transform.parent = null;
            role.target = PosGroup[PosIndex];
            objList.RemoveAt(index);
            PosIndex++;
            role.Load();
            role.Init();
        }

        if (Input.GetKeyDown(KeyCode.Q))
        {
            int index = Random.Range(0, objList.Count);
            GameObject pickture = objList[index];
            GameObject obj = GameObject.Instantiate<GameObject>(pickture);
            //obj.transform.position = pickture.transform.position;
            obj.transform.position = parent.position + parent.forward * Radius;
            obj.transform.rotation = pickture.transform.rotation;
            obj.transform.parent = null;
            Role newRole = new Role(obj.transform, camera, parent, centerPos);
            newRole.Load();
            newRole.Init();
            role = newRole;
        }

        if (role!=null&&role.transform != null)
        {
            bool complete = role.OnUpdate();
            if (complete)
            {
                rewardRoles.Add(role);
                Role r = role;
                role = null;
                r.transform.DOShakePosition(0.8f).OnComplete(delegate {
                    r.transform.DOMove(PosGroup[PosIndex].position, 0.8f);
                });
                PosIndex++;
            }
        }

        if (Input.GetKeyDown(KeyCode.A))
        {
            Show0();
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            Show1();
        }

        
    }

}
