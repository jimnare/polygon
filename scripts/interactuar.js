const hre = require("hardhat");

async function main() {
  const [owner] = await hre.ethers.getSigners();

  const contrato = await hre.ethers.getContractAt(
    "Certificados",
    "0x19010A4646677755744a5A7fEAD4C0fC7b5076b5"
  );

  await contrato.emitirCertificado(
    owner.address,
    "Juan Pérez",
    "Certificado en Polygon Amoy",
    "QmFAKEIPFSHASH1234567890abc"
  );

  console.log("✅ Certificado emitido en Amoy.");
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
