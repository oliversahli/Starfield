using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour {

    public static GameManager Instance;
    [HideInInspector]
    public GameObject cameraObj;

    public Camera renderTextureCam;
    public Material renderTextureMaterial;

	void Awake () {
        Instance = this;

        this.cameraObj = GameObject.FindGameObjectWithTag("MainCamera");
        this.SetRenderTexture();
	}

    void SetRenderTexture()
    {
        if (this.renderTextureMaterial != null && this.renderTextureCam != null)
        {
            if (this.renderTextureCam.targetTexture != null)
                this.renderTextureCam.targetTexture.Release();
            this.renderTextureCam.targetTexture = new RenderTexture(Screen.width, Screen.height, 16);
            this.renderTextureMaterial.SetTexture("_Texture",this.renderTextureCam.targetTexture);
        }
    }
}
