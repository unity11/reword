using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.Video;

public class TestVideo : MonoBehaviour
{

    public Text text;
    private void Start()
    {
        string[] arguments = Environment.GetCommandLineArgs();
        text.text = arguments[1];
    }

}
