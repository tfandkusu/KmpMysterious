package com.tfandkusu.nested

class A {
    class B {
        data class C(
            val id: Long,
            val name: String,
        )
    }
}
