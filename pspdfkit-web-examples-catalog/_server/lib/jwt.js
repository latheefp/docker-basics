const jwt = require("jsonwebtoken");
const uuid = require("uuid");

const { JWT_PRIVATE_KEY } = process.env;

if (!JWT_PRIVATE_KEY) {
  throw new Error("You have to set the JWT_PRIVATE_KEY environment variable.");
}

function createJwt(documentId, layerName, jwtParameters = {}) {
  return jwt.sign(
    {
      permissions: ["read-document", "write", "download"],
      document_id: documentId,
      layer: layerName,
      ...jwtParameters,
    },
    JWT_PRIVATE_KEY,
    {
      algorithm: "RS256",
      expiresIn: 3 * 24 * 60 * 60, // 3 days
      jwtid: uuid.v4(),
      allowInsecureKeySizes: true,
    }
  );
}

function createJwtForCover(documentId, layerName) {
  return jwt.sign(
    {
      permissions: ["cover-image"],
      document_id: documentId,
      layer: layerName,
    },
    JWT_PRIVATE_KEY,
    {
      algorithm: "RS256",
      expiresIn: 3 * 24 * 60 * 60, // 3 days
    }
  );
}

module.exports = {
  createJwt,
  createJwtForCover,
};
