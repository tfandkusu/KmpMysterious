package com.tfandkusu.mysterious

class JvmPlatform : Platform {
    override val name: String = "JVM"
}

actual fun getPlatform(): Platform = JvmPlatform()
