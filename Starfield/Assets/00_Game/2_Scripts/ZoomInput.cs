using UnityEngine;
using System.Collections.Generic;

public class ZoomInput : MonoBehaviour
{

    public float speed = 0.4f;
    [Range(0, 1)]
    public float currentZoom = 0f;

    private Vector2 worldStartPoint;

    private int fingerCount = 0;

    public SkinnedMeshRenderer targetSkinnedMehsRenderer;
    public float blendShapeMultiplyer = 2f;
    public GameObject targetMovingObject;
    public float minZLocalPos = 0f;
    public float maxZLocalPos = 10f;

    private Touch touchZero;
    private Touch touchOne;

    private Vector2 touchZeroPrevPos;
    private Vector2 touchOnePrevPos;

    private float prevTouchDeltaMag;
    private float touchDeltaMag;

    private float deltaMagnitudeDiff;

    private GameObject targetLookAt;


    void Start()
    {
        SetValues();
        //this.LookAtTarget();

    }

    void Update()
    {
        this.CheckTouchInput();
        this.CheckTastaturInput();
    }

    void CheckTouchInput()
    {
        if (Input.touchCount == 2)
        {

            this.fingerCount = 2;
            this.touchZero = Input.GetTouch(0);
            this.touchOne = Input.GetTouch(1);

            this.touchZeroPrevPos = this.touchZero.position - this.touchZero.deltaPosition;
            this.touchOnePrevPos = this.touchOne.position - this.touchOne.deltaPosition;

            this.prevTouchDeltaMag = (this.touchZeroPrevPos - this.touchOnePrevPos).magnitude;
            this.touchDeltaMag = (this.touchZero.position - this.touchOne.position).magnitude;

            this.deltaMagnitudeDiff = this.prevTouchDeltaMag - this.touchDeltaMag;

            this.currentZoom += this.deltaMagnitudeDiff * this.speed / 20 * -1;
            this.currentZoom = Mathf.Clamp(this.currentZoom, 0, 1);
            this.SetValues();
        }
    }

    void CheckTastaturInput()
    {
        if (Input.GetAxis("Vertical") != 0)
        {
            this.currentZoom += Input.GetAxis("Vertical") * this.speed / 20 * -1;
            this.currentZoom = Mathf.Clamp(this.currentZoom, 0, 1);
            this.SetValues();
        }
    }

    public void LookAtTarget()
    {
        if (this.targetLookAt == null)
            this.targetLookAt = GameObject.FindGameObjectWithTag("MainCamera");

        if (this.targetLookAt != null)
        {
            this.gameObject.transform.LookAt(this.targetLookAt.transform, Vector3.up);
        }
    }

    void SetValues()
    {
        if (this.targetSkinnedMehsRenderer != null)
            this.targetSkinnedMehsRenderer.SetBlendShapeWeight(0, Mathf.Clamp(this.currentZoom * 100f * this.blendShapeMultiplyer, 0f, 100f));

        if (this.targetMovingObject != null)
            this.targetMovingObject.transform.localPosition = new Vector3(0, 0, Mathf.Lerp(this.minZLocalPos, this.maxZLocalPos, this.currentZoom));
    }
}
