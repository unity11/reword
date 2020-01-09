using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class Test1 : MonoBehaviour
{

    public Transform t;
  
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.V))
        {
            t.DOShakePosition(1);
        }
        if (Input.GetKeyDown(KeyCode.E))
        {
            t.DOShakeRotation(1);
        }
    }
}
