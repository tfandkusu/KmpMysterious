package com.tfandkusu.qux

import kotlin.experimental.ExperimentalObjCName
import kotlin.native.ObjCName

@OptIn(ExperimentalObjCName::class)
@ObjCName(name = "QuxHoge")
data class Hoge(val id: Long, val name: String)
