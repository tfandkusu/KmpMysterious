package com.tfandkusu.bar

import kotlin.experimental.ExperimentalObjCName
import kotlin.native.ObjCName

@OptIn(ExperimentalObjCName::class)
@ObjCName(swiftName = "BarHoge")
data class Hoge(val id: Long, val name: String)

fun printBarHoge(hoge: Hoge) {
    println(hoge)
}
