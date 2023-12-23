plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
            isStatic = true
        }
    }
    jvm()
    sourceSets {
        commonMain.dependencies {
            implementation(libs.coroutine)
        }
        commonTest.dependencies {
            implementation(libs.kotlin.test)
        }
        jvmTest.dependencies {
            implementation(kotlin("test"))
            implementation(libs.konsist)
        }
    }
}

android {
    namespace = "com.tfandkusu.mysterious"
    compileSdk = 34
    defaultConfig {
        minSdk = 24
    }
}
