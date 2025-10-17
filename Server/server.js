import express from "express"
import { execSync } from "child_process"
import crypto from "crypto"

const app = express()
const PORT = 8080;

const activeServers = {}

function getRandomPort() {
    
}