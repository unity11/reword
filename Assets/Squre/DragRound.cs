using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DragRound : MonoBehaviour
{
    public Transform obj;
    public float speed = 2;

    public bool _mouseDown = false;


    public float fMouseX;
    public float fMouseY;

    public float detaTime=0.1f;

    public float scaleSpeed=2;
    public float curScaleValue;

    public float rotaSpeed=1;

    public Transform camera;

    public bool stop=false;
    void Update()
    {
        Rota();
        ObjScale();
    }

    private void ObjRota()
    {
        if (Input.GetMouseButtonDown(0))
            _mouseDown = true;
        else if (Input.GetMouseButtonUp(0))
            _mouseDown = false;


        if (_mouseDown)
        {
            fMouseX = Input.GetAxis("Mouse X");
            fMouseY = Input.GetAxis("Mouse Y");
            //obj.Rotate(Vector3.up, -fMouseX * speed, Space.World);
            //obj.Rotate(Vector3.right, fMouseY * speed, Space.World);
        }
        else
        {
            fMouseX = Mathf.Lerp(fMouseX, 0, detaTime);
            fMouseY = Mathf.Lerp(fMouseY, 0, detaTime);
        }

        obj.Rotate(Vector3.up, -fMouseX * speed, Space.World);
        obj.Rotate(Vector3.right, fMouseY * speed, Space.World);

    }


    private void ObjScale()
    {
        
        //Zoom out
        if (Input.GetAxis("Mouse ScrollWheel") < 0)
        {
            //if (Camera.main.fieldOfView <= 100)
                //Camera.main.fieldOfView += scaleSpeed;
            curScaleValue = -scaleSpeed;
        }
        //Zoom in
        if (Input.GetAxis("Mouse ScrollWheel") > 0)
        {
            //if (Camera.main.fieldOfView > 40)
                //Camera.main.fieldOfView -= scaleSpeed;
            curScaleValue = scaleSpeed;
        }

        Vector3 pos = camera.position;

        pos.z += curScaleValue * Time.deltaTime;
        //Camera.main.fieldOfView -= curScaleValue;
        camera.position = pos;
        curScaleValue = Mathf.Lerp(curScaleValue, 0, detaTime);
   
    }

    public float curRotaSpeed;
    public float rotaDetlaTime=0.1f;
    private void Rota()
    {
        //Quaternion qua = Random.rotation;
        //transform.Rotate(qua.eulerAngles* rotaSpeed);
         
        if (stop)
        {
            curRotaSpeed = Mathf.Lerp(curRotaSpeed, 0, rotaDetlaTime);
        }
        else
        {
            curRotaSpeed = rotaSpeed * Time.deltaTime;
        }
        transform.Rotate(Vector3.up, curRotaSpeed, Space.World);
    }
}
