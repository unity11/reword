using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.Video;

public class TestVideo : MonoBehaviour
{

 
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Q)&&Input.GetKey(KeyCode.LeftControl))
        {
            Application.Quit();
        }
    }
}
