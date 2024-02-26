// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

interface IBlog {
    struct Post {
        uint256 id;
        string title;
        string content;
        uint256 timestamp;
    }
}
