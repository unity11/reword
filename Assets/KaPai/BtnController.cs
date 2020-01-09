using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class BtnController : MonoBehaviour
{
    public Button specialBtn;
    public Button firstBtn;
    public Button secondBtn;
    public Button thirdBtn;
    public Button fourthBtn;
    public Button fifthBtn;
    public Button sixthBtn;
    public Button cashBtn;

    

    public void Init(RewordMgr rewordMgr)
    {
        specialBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.special);
        });
        firstBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.first);
        });
        secondBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.second);
        });
        thirdBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.third);
        });
        fourthBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.fourth);
        });
        fifthBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.fifth);
        });
        sixthBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.sixth);
        });
        cashBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.cash);
        });
    }
}
