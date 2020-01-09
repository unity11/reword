using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class BtnController : MonoBehaviour
{
    public Button firstBtn;
    public Button secondBtn;
    public Button thirdBtn;
    public Button fourthBtn;
    public Button fifthBtn;
    public Button sixthBtn;
    public Button cashBtn;

    

    public void Init(RewordMgr rewordMgr)
    {
        cashBtn.onClick.AddListener(delegate
        {
            rewordMgr.SetNewReword(RewordType.cash);
        });

        //specialBtn.onClick.AddListener(delegate
        //{
        //    rewordMgr.SetNewReword(RewordType.special);
        //});
    }
}
