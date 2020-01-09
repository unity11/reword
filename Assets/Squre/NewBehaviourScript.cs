using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{

    public Transform t;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.A))
        {
           
            Debug.LogError(t.forward);
            //t.rotation = Quaternion.LookRotation(dir);
        }

        if (Input.GetKeyDown(KeyCode.B))
        {
            Vector3 dir = t.position.normalized;

            t.rotation = Quaternion.LookRotation(dir);
            //t.rotation = Quaternion.LookRotation(dir);
        }

        if (Input.GetKeyDown(KeyCode.S))
        {
            Vector3 dir = t.position.normalized;

            t.forward = dir;
        }
    }
}
