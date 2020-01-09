using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.Video;

public class TestVideo : MonoBehaviour
{
    public VideoPlayer videoPlayer;
    public float time;
    public Action action;

    public float videoTime;

    public ulong frameIndex;

    
    void Start()
    {
        videoPlayer.Pause();
        videoPlayer.errorReceived += delegate
        {
            Debug.LogError("errorReceived");
        };
        videoPlayer.frameDropped += delegate
        {
            Debug.LogError("frameDropped");
        };
        videoPlayer.frameReady += delegate
        {
            Debug.LogError("frameReady");
        };
        videoPlayer.prepareCompleted += delegate
        {
            Debug.LogError("prepareCompleted");

        };
        videoPlayer.seekCompleted += delegate
        {
            Debug.LogError("seekCompleted");
            //frameIndex++;
            //videoPlayer.Play();
        };
        videoPlayer.clockResyncOccurred += delegate
        {
            Debug.LogError("clockResyncOccurred");
        };
        StartCoroutine(Play());
    }

    IEnumerator Play()
    {
        bool isPause = false;
        while (frameIndex<videoPlayer.frameCount)
        {
            //Debug.LogError(videoPlayer.frame);
            if (!isPause)
            {
                videoPlayer.Play();
            }
            yield return 0;
            videoPlayer.Pause();
            //if (videoPlayer.frame== (long)frameIndex)
            //{
            //    isPause = true;
            //}
            //else
            //{
            //    isPause = false;
            //}
            //frameIndex++;
        }
    }
    public void SetAction()
    {
        videoPlayer.frame = 30;
        if (videoPlayer.frame>90)
        {
            Debug.LogError("aaaaaa:"+videoPlayer.frame);
        }
        action = delegate
        {
            Debug.LogError("1111");
        };
    
        videoPlayer.Pause();
        Debug.LogError(videoPlayer.isPrepared);
        Debug.LogError(videoPlayer.isPlaying);
        Debug.LogError(videoPlayer.isPaused);
        Debug.LogError(videoPlayer.isPaused);
    }
    
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.V))
        {
            SetAction();
            //videoPlayer.frame = 90;
        }
        if (videoPlayer.frame >= 90)
        {
            if (action != null)
            {
                action();
                action = null;
            }
        }
  

    }
}
