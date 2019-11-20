using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Moon : MonoBehaviour
{
    public GameObject Earth;
    public float speed;

    // Update is called once per frame
    void Update()
    {
        transform.RotateAround(Earth.transform.position, Vector3.down, speed * Time.deltaTime);
    }
}
