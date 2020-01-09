using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
using UnityEngine.UI;
using System;
public class VideoController : MonoBehaviour
{

    public VideoPlayer ScenceVideo;

    public long CurFrame;
    public RawImage rawImage;
    public double time;
    public List<VideoClip> videoClips;


    public Slider slider;
    void Start()
    {
        //SetClip(videoClips[0]);
        slider.maxValue = (float)ScenceVideo.clip.length;

        ScenceVideo.errorReceived += delegate
        {
            //Debug.LogError("errorReceived");
        };
        ScenceVideo.frameDropped += delegate
        {
            //Debug.LogError("frameDropped");
        };
        ScenceVideo.frameReady += delegate
        {
            //Debug.LogError("frameReady");
        };
        ScenceVideo.prepareCompleted += delegate
        {
            //Debug.LogError("prepareCompleted");

        };
        ScenceVideo.seekCompleted += delegate
        {
            //Debug.LogError("seekCompleted");
            ScenceVideo.Play();
        };
        ScenceVideo.clockResyncOccurred += delegate
        {
            //Debug.LogError("clockResyncOccurred");
        };

        ScenceVideo.loopPointReached += delegate
        {
            Debug.LogError("loopPointReached");
            if (action != null)
            {
                Action _action = action;
                action = null;
                _action();
            }

            if (ScenceVideo.clip.name=="loop")
            {
                ScenceVideo.Play();
            }
        };
    }


    private Action action;
    public float OverTime;

    public IEnumerator RewordOnce(Action callback, float startTime, float overTime,int index)
    {
        VideoClip clip = videoClips[index];
        if (ScenceVideo.clip!=clip)
        {
            SetClip(clip);
        }
        yield return StartCoroutine(RewordOnce(callback,startTime,overTime));
    }

    public IEnumerator RewordOnce(Action callback,float startTime,float overTime)
    {
 
        ScenceVideo.time = startTime;
        time = startTime;
        OverTime = overTime;
        if (OverTime<0)
        {
            OverTime = (float)ScenceVideo.clip.length-0.1f;
        }
        ScenceVideo.Play();

        yield return new WaitForSeconds(2);
        action = callback;
    }

    // Update is called once per frame
    void Update()
    {
        if (ScenceVideo.time >= OverTime)
        {
            if (action!=null)
            {
                //Action _action = action;
                //action = null;
                //_action();
            }
        }

        slider.value = (float)ScenceVideo.time;
    }

    public void SetClip(VideoClip clip)
    {
        ScenceVideo.clip = clip;
        
    }
}
