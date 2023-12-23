package com.tfandkusu.mysterious

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform
