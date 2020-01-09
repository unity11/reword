using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using DG.Tweening;
[Serializable]
public class Role
{


    public Transform center;
    public Transform camera;
    public Transform transform;
    public Transform target;

    public float baseAngle0;    //绕着y轴的角度
    public float baseAngle1;    //与xz平面的角度

    public float angle0;    //绕着y轴的角度
    public float angle1;    //与xz平面的角度
    public float limitAngle;
    public float targetHighAngle;

    public float baseRadius;
    public float radius;

    public float radian0;   //绕着y轴的弧度
    public float radian1;   //与xz平面的弧度;


    public float roleSpeed=100;
    public float radiusSpeed=2;

    private Vector3 basePosition;
    private float highDir;

    
    public Role() { }

    public Role(Transform transform, Transform camera,Transform center,Transform target)
    {
        this.transform = transform;
        this.camera = camera;
        this.center = center;
        this.target = target;
    }

    public void Load()
    {
        basePosition = transform.position;
        highDir = basePosition.y >= 0 ? 1 : -1;

    }
    private float dd;
    public float _x=0.6f;
    public void Init()
    {
        transform.position = basePosition;
        baseRadius = Vector3.Distance(center.position, transform.position);
        Vector3 from = transform.position - center.position;
        Vector3 camDir = (camera.position - center.position).normalized;
        from.y = 0;
        angle0 = SignedAngleBetween(from.normalized, camDir, -center.up);
        angle1 = Vector3.Angle(from, (transform.position - center.position).normalized);
        if (transform.position.y < center.position.y)
        {
            angle1 = -angle1;
        }

        baseAngle1 = angle1;

        radian0 = (Mathf.PI * 2) / 360f * angle0;
        LimitAngle();

        if (angle0<=limitAngle)
        {
            angle0 += 360;
        }

        baseAngle0 = angle0-limitAngle;
        dd = (angle1 >= targetHighAngle ? 1 : -1);
    }

    private void LimitAngle()
    {
        Vector3 from = target.position - center.position;
        Vector3 camDir = (camera.position - center.position).normalized;
        from.y = 0;
        limitAngle = SignedAngleBetween(from.normalized, camDir, -center.up);
        targetHighAngle = Vector3.Angle(from.normalized, (target.position - center.position).normalized);
        if (target.position.y<center.position.y)
        {
            targetHighAngle = -targetHighAngle;
        }

    }

    public float SignedAngleBetween(Vector3 a, Vector3 b, Vector3 n)
    {
        float angle = Vector3.Angle(a, b);
        float sign = Mathf.Sign(Vector3.Dot(n, Vector3.Cross(a, b)));
        float signed_angle = angle * sign;
        return (signed_angle <= 0) ? 360 + signed_angle : signed_angle;
    }
    private bool complete = false;
         
    public bool OnUpdate()
    {

        if (!complete)
        {
            if (angle0 > limitAngle)
            {
                float delta = roleSpeed * Time.deltaTime;
                angle0 -= delta;
                //radius += radiusSpeed * Time.deltaTime;

            }
            if (angle0 < limitAngle)
            {
                angle0 = limitAngle;
            }
            Lerp();
            complete = angle0 == limitAngle;
        }
        return complete;
    }

    public void Lerp()
    {
        float lerp =1-(angle0-limitAngle) / baseAngle0;
        Debug.LogError(lerp);
        float targetRadius = Vector3.Distance(target.position, center.position);
        radius = Mathf.Lerp(baseRadius, targetRadius, lerp);
        angle1 = Mathf.Lerp(baseAngle1, targetHighAngle, lerp);
        radian1 = (Mathf.PI * 2) / 360f * angle1* dd;

        float posY = Mathf.Sin(radian1) * radius* highDir;
        radian0 = (Mathf.PI * 2) / 360f * angle0;
        float posX = radius * (Mathf.Cos(radian1)) * (Mathf.Cos(this.radian0));//计算x位置
        float posZ = radius * (Mathf.Cos(radian1)) * (Mathf.Sin(this.radian0));//计算y位置

        Vector3 pos = transform.position;
        //pos.x = -posZ;
        pos.x = -posZ * _x;
        pos.z = -posX;
        pos.y = posY;
        transform.position = pos;
        transform.rotation = Quaternion.Lerp(transform.rotation,Quaternion.LookRotation(pos.normalized),0.5f);
    }


}
