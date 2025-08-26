using { sap.cap.session as db } from '@sap/cds/common';

service MyService {

    entity ConfigProducts as projection on db.ConfigProduct;

annotate MyService.ConfigProducts with @odata.draft.enabled;

}
