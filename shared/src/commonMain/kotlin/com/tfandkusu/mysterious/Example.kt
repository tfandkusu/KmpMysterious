package com.tfandkusu.mysterious

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow

private val exampleMutableStateFlow = MutableStateFlow(0)

fun getExampleFlow(): Flow<Int> {
    return exampleMutableStateFlow
}

fun countUpExampleFlowValue() {
    ++exampleMutableStateFlow.value
}
