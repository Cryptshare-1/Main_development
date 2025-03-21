// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FileStorage {
    struct File {
        string name;
        string hash;
        uint256 timestamp;
    }

    mapping(address => File[]) private files;

    event FileUploaded(address indexed user, string name, string hash, uint256 timestamp);

    function uploadFile(string memory _name, string memory _hash) public {
        File memory newFile = File({
            name: _name,
            hash: _hash,
            timestamp: block.timestamp
        });

        files[msg.sender].push(newFile);
        emit FileUploaded(msg.sender, _name, _hash, block.timestamp);
    }

    function getFiles() public view returns (File[] memory) {
        return files[msg.sender];
    }
}