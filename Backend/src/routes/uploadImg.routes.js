const express = require("express");
const router = express.Router();
const Multer = require('multer');
const { Storage } = require("@google-cloud/storage");
const { UploadToBucket } = require('../lib/UploadToBucket');

const storage = new Storage({
    projectId: process.env.GCLOUD_PROJECT,
    credentials: {
        client_email: process.env.GCLOUD_CLIENT_EMAIL,
        private_key: process.env.GCLOUD_PRIVATE_KEY
    }
})

const multer = Multer({
    storage: Multer.memoryStorage(),
    limits: {
        fileSize: 5 * 1024 * 1024
    }
})


const bucket = storage.bucket(process.env.GCS_BUCKET);

router.post('/imageupload', multer.single('file'), async (req, res) => {
    UploadToBucket(req)
    res.json('ok');
})

module.exports = router;