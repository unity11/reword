using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.Events;
public class RewindParticlesSystem : MonoBehaviour
{
    public ParticleSystem[] particleSystems0;
    public ParticleSystem[] particleSystems1;
    public ParticleSystem[] particleSystems2;
    float[] simulationTimes;

    private float startTime = 2.0f;
    private float simulationSpeedScale = 1.0f;

    public float MaxTime=5;


    public float time;
    public float backSpeed=1;
    public bool isBack = false;

    private Coroutine coroutine;

    public EffectEvent effectEvent;

    public void PlayForword(Action action)
    {
        isBack = false;
        if (coroutine != null)
        {
            StopCoroutine(coroutine);
        }
        coroutine = StartCoroutine(Play(action));
    }


    public void PlayBack(Action action)
    {
        for (int i = 0; i < particleSystems2.Length; i++)
        {
            particleSystems2[i].gameObject.SetActive(false);
        }
        isBack = true;
        if (coroutine != null)
        {
            StopCoroutine(coroutine);
        }
        coroutine = StartCoroutine(Play(action));
    }

    IEnumerator Play(Action action)
    {
        Action callBack =action;
        if (isBack)
        {
            if (time > MaxTime) { time = MaxTime; }
        }
        else
        {
            if (time < 0) { time = 0; }
        }
        while (true)
        {
            yield return 0;
            UpdateParticle(particleSystems0, time > MaxTime ? MaxTime : time);
            UpdateParticle(particleSystems1, time);
            if (isBack)
            {
                time -= Time.deltaTime* backSpeed;
                if (time<0)
                {
                    if (callBack != null)
                    {
                        callBack();
                        callBack = null;
                    }
                }
               
            }
            else
            {
                time += Time.deltaTime * backSpeed;
                if (effectEvent!=null&&time>effectEvent.time)
                {
                    effectEvent.action.Invoke();
                    effectEvent = null;
                }
                if (time>MaxTime)
                {
                    if (callBack != null)
                    {
                        callBack();
                        callBack = null;
                    }
                }

            }
        }
    }
    public void UpdateParticle(ParticleSystem[] particleSystems,float time)
    {
        particleSystems[0].Stop(true, ParticleSystemStopBehavior.StopEmittingAndClear);

        for (int i = particleSystems.Length - 1; i >= 0; i--)
        {
            bool useAutoRandomSeed = particleSystems[i].useAutoRandomSeed;
            particleSystems[i].useAutoRandomSeed = false;

            particleSystems[i].Play(false);

            float deltaTime = particleSystems[i].main.useUnscaledTime ? Time.unscaledDeltaTime : Time.deltaTime;
            //simulationTimes[i] -= (deltaTime * particleSystems[i].main.simulationSpeed) * simulationSpeedScale;

            //float currentSimulationTime = startTime + simulationTimes[i];
            float currentSimulationTime = time;
            particleSystems[i].Simulate(currentSimulationTime, false, false, true);

            particleSystems[i].useAutoRandomSeed = useAutoRandomSeed;

            if (currentSimulationTime < 0.0f)
            {
                particleSystems[i].Play(false);
                particleSystems[i].Stop(false, ParticleSystemStopBehavior.StopEmittingAndClear);
            }
        }
    }

    private void OnDestroy()
    {
        if (coroutine!=null)
        {
            StopCoroutine(coroutine);
        }
    }
}

[Serializable]
public class EffectEvent
{
    public UnityEvent action;
    public float time;
    public EffectEvent next;
}

