const hre = require("hardhat");

async function main() {
  const Certificados = await hre.ethers.getContractFactory("Certificados");
  const contrato = await Certificados.deploy();

  await contrato.waitForDeployment(); // 👈 este es el método correcto con Ethers v6+
  console.log("Contrato desplegado en:", await contrato.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

