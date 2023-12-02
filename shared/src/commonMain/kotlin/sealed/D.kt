package sealed

sealed interface D {
    data object E: D
    data object F: D
}

sealed class G {
    data class H(val id: Long, val name: String): G()
    data class I(val id: Long, val name: String): G()
}

val d: D = D.E
