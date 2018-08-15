using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PortalPlacer : MonoBehaviour {

    public GameObject portal;
    public Transform trackingTarget;

    public float smoothing = 0.2f;
    public ZoomInput targetZoomInputController;

    private void FixedUpdate()
    {
        if (this.trackingTarget != null)
        {
            this.transform.position = Vector3.Lerp(this.transform.position, this.trackingTarget.position, this.smoothing);

            this.transform.rotation = Quaternion.Lerp(this.transform.rotation, this.trackingTarget.rotation, this.smoothing);
        }
    }

    public void SetPortalTransform(Transform target)
    {
        if (!this.portal.activeInHierarchy)
            this.portal.SetActive(true);

        //this.gameObject.transform.SetParent(target);
        //this.gameObject.transform.localPosition = Vector3.zero;
        //this.gameObject.transform.localRotation = Quaternion.identity;
        this.gameObject.transform.localScale = target.localScale;
        this.trackingTarget = target;
        if (this.targetZoomInputController != null)
            this.targetZoomInputController.LookAtTarget();
    }

    public void ResetPortalTransform()
    {
        //this.gameObject.transform.parent = null;
        this.trackingTarget = null;
    }
}
