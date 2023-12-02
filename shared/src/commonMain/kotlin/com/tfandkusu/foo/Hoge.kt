package com.tfandkusu.foo

import kotlin.experimental.ExperimentalObjCName
import kotlin.native.ObjCName

@OptIn(ExperimentalObjCName::class)
@ObjCName(swiftName = "FooHoge")
data class Hoge(val id: Long, val name: String)

fun printFooHoge(hoge: Hoge) {
    println(hoge)
}
