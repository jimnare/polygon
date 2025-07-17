// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Certificados {
    address public owner;

    struct Certificado {
        string estudiante;
        string curso;
        string ipfsHash;
        uint256 fecha;
    }

    mapping(address => Certificado[]) public certificadosPorAlumno;

    event CertificadoEmitido(address indexed alumno, string curso, string ipfsHash, uint256 fecha);

    constructor() {
        owner = msg.sender;
    }

    modifier soloOwner() {
        require(msg.sender == owner, "Solo el owner puede emitir certificados");
        _;
    }

    function emitirCertificado(address alumno, string memory estudiante, string memory curso, string memory ipfsHash) public soloOwner {
        Certificado memory nuevo = Certificado(estudiante, curso, ipfsHash, block.timestamp);
        certificadosPorAlumno[alumno].push(nuevo);
        emit CertificadoEmitido(alumno, curso, ipfsHash, block.timestamp);
    }

    function obtenerCertificados(address alumno) public view returns (Certificado[] memory) {
        return certificadosPorAlumno[alumno];
    }
}
