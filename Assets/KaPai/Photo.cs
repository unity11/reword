using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using System;
public class Photo : MonoBehaviour
{
    [HideInInspector]
    public GameObject obj;
    public RawImage pickture;
    public RewindParticlesSystem rewindParticle;
    public ParticleSystem photo_fire;   //溶解特效
    public Text nameText;
    public CanvasGroup nameGroup;
    public float capx;
    public float capy;
   
    public float capwidth;
    public float capheight;

    static string ImageFormat = ".jpg";

    private Tweener nameTweener;
    public void Init(Material baseFireMat, RewordInfo rewordInfo, RewordWebInfo webInfo)
    {
        Material fireMat = new Material(baseFireMat.shader);
        fireMat.CopyPropertiesFromMaterial(baseFireMat);
        string image = webInfo.image;
        string path = image.Substring(1, image.Length-1- ImageFormat.Length);
        Debug.LogError(path);
        rewordInfo.tex = Resources.Load<Texture>(path);
        fireMat.SetTexture("_main_texture", rewordInfo.tex);

        ParticleSystemRenderer renderer = photo_fire.GetComponent<ParticleSystemRenderer>();
        renderer.material = fireMat;
        renderer.trailMaterial = fireMat;
        pickture.GetComponent<RectTransform>().anchoredPosition = rewordInfo.pos;
        obj = pickture.gameObject;
        nameText.text = webInfo.department+":"+ webInfo.name;
        nameGroup.alpha = 0;
    }

    public void SetSize(float capx,float capy,float capwidth,float capheight)
    {
        this.capx = capx;
        this.capy = capy;
        this.capwidth = capwidth;
        this.capheight = capheight;
    }
         

    public void PlayBack(Action action)
    {
        KillTweener();
        nameTweener = nameGroup.DOFade(0, 0.5f).OnComplete(delegate
        {
            rewindParticle.PlayBack(action);
        });
    }
    public void SetBgTex(Texture tex)
    {
        pickture.texture = tex;
    }   

    public void ActiveBack()
    {
        pickture.enabled = true;
        KillTweener();
        nameTweener = nameGroup.DOFade(1, 0.5f);
    }

    private void KillTweener()
    {
        if (nameTweener!=null)
        {
            nameTweener.Kill();
        }
    }
    private void OnDestroy()
    {
        KillTweener();
    }
}
