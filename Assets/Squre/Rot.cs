using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rot : MonoBehaviour
{
    public Transform aroundPoint;//围绕的物体
    public float angularSpeed;//角速度
    public float aroundRadius;//初始圆半径
    private float angled;

    public Transform camera;


    public float angleSpeed;
    private bool aa=false;

    public Vector3 speed;
    void Update()
    {



        //angled += (angularSpeed * Time.deltaTime) % 360;//累加已经转过的角度
        //                                                //float posX = aroundRadius * Mathf.Sin(angled * Mathf.Deg2Rad);//计算x位置
        //                                                //float posZ = aroundRadius * Mathf.Cos(angled * Mathf.Deg2Rad);//计算y位置
        //float posX = aroundRadius * (Mathf.Cos(angled) + angled * Mathf.Sin(angled));//计算x位置
        //float posZ = aroundRadius * (Mathf.Sin(angled) - angled * Mathf.Cos(angled));//计算y位置
        //transform.position = new Vector3(posX, 0, posZ) + aroundPoint.position;//更新位置

        if (Input.GetKeyDown(KeyCode.A))
        {
            StartRota();
        }

        if (aa)
        {

            GetAngle(transform.position, Vector3.zero, camera.position, out HighVec, out Dir, out TargetDir);
            float angle = SignedAngleBetween(Dir.normalized, TargetDir, HighVec);
            Debug.LogError("angle:" + angle);
            transform.RotateAround(Vector3.zero, HighVec, angleSpeed);
        }
    }

    private Vector3 Dir;
    private Vector3 TargetDir;
    private Vector3 HighVec;
    private void StartRota()
    {
        GetAngle(transform.position, Vector3.zero, camera.position, out HighVec, out Dir, out TargetDir);
        aa = true;
    }


    private void GetAngle(Vector3 rota,Vector3 center,Vector3 toPos,out Vector3 highVec,out Vector3 dir,out Vector3 targetDir)
    {
        dir = (rota - center).normalized;
        targetDir = (toPos - center).normalized;
        highVec = Vector3.Cross(targetDir, dir).normalized;
    }

    //private float getAngle(Vector3 tarVec,Vector3 curVec,Vector3 dir)
    //{

    //}

    //参数 a：起始向量; b：目标向量; n：旋转方向
    public static float SignedAngleBetween(Vector3 a, Vector3 b, Vector3 n)
    {
        float angle = Vector3.Angle(a, b);
        float sign = Mathf.Sign(Vector3.Dot(n, Vector3.Cross(a, b)));
        float signed_angle = angle * sign;
        return (signed_angle <= 0) ? 360 + signed_angle : signed_angle;
    }
}
