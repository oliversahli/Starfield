using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HomepageImagePlane : MonoBehaviour {


    public string url = "https://scontent.cdninstagram.com/vp/1d7f26d61dbcd0158615ecf2df8c3e57/5BF2124A/t51.2885-15/sh0.08/e35/s640x640/37286567_253235065406797_2661750190070824960_n.jpg";
    public MeshRenderer renderComp;

    IEnumerator Start()
    {
        Texture2D tex;
        tex = new Texture2D(4, 4, TextureFormat.DXT1, false);
        using (WWW www = new WWW(url))
        {
            yield return www;
            www.LoadImageIntoTexture(tex);
            if (this.renderComp != null)
                this.renderComp.material.mainTexture = tex;
        }
    }

    void Update () {
        if (GameManager.Instance != null && GameManager.Instance.cameraObj != null)
        {
            this.transform.LookAt(GameManager.Instance.cameraObj.transform);
        }
	}
}
