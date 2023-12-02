package com.tfandkusu.mysterious

import com.lemonappdev.konsist.api.Konsist
import kotlin.test.Test
import kotlin.test.assertEquals

class DuplicateClassTest {
    @Test
    fun check() {
        Konsist.scopeFromProject() // このプロジェクトについて
            .classes() // すべてのクラスを取得
            .map {
                // ObjcNameアノテーションを取得
                val objCNameAnnotation = it.annotations.find { annotation ->
                    annotation.name == "ObjCName"
                }
                // name 引数の値を取得
                val objCName = objCNameAnnotation?.arguments?.find { argument ->
                    argument.name == "name"
                }?.value
                // ObjCName アノテーションの name 引数があればそれを、なければクラス名を返す
                objCName ?: it.name
            } // 名前だけにする
            .groupBy { it } // 名前でグループ化
            .mapValues { it.value.size } // グループごとの数にする
            .forEach { (className, count) ->
                assertEquals(1, count, "$className クラスが重複しています。")
            }
    }
}
