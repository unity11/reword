using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class Test : MonoBehaviour
{

    public float len;
    public Transform target;
    public Transform camera;

    public float baseAngle0;
    public float baseAngle1;

    public float angle0;
    public float angle1;
   

    public float angularSpeed;//角速度

    public float radius;

    public float radian0;
    public float radian1;

    public Role role;

    public VideoPlayer videoPlayer;

    private void Start()
    {
        role.Load();
        role.Init();
    }
    public void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawLine(transform.position, target.position);

        Gizmos.DrawLine(transform.position, transform.forward*len);
        Gizmos.DrawLine(transform.position, transform.forward * -len);

        Gizmos.DrawLine(transform.position, transform.right * len);
        Gizmos.DrawLine(transform.position, transform.right * -len);

        Gizmos.DrawLine(transform.position, transform.up * len);
        Gizmos.DrawLine(transform.position, transform.up * -len);
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.S))
        {
            role.Init();
        }
        role.OnUpdate();
        return;
    }


}

