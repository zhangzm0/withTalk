// app/build.gradle.kts
import java.util.Properties
import java.io.FileInputStream

@Suppress("DSL_SCOPE_VIOLATION") // TODO: Remove once KTIJ-19369 is fixed
plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.kotlin.compose)
    // 与 Kotlin 1.9.10 配套
    kotlin("plugin.serialization") version "1.9.10"
    // KSP 1.9.10-1.0.13 是最后一组支持 Java 8 的版本
    id("com.google.devtools.ksp") version "1.9.10-1.0.13"
}

val localProperties = Properties().apply {
    val f = rootProject.file("local.properties")
    if (f.exists()) load(FileInputStream(f))
}

android {
    namespace = "com.example.everytalk"
    compileSdk = 34          // 34 是最后一个能在 JDK 8 下编译的版本
    buildToolsVersion = "34.0.0"
    ndkVersion = "20.1.5948944" // 20 系列最后一个 32/64 通用版

    defaultConfig {
        applicationId = "com.example.everytalk"
        minSdk = 21              // Android 5.0
        targetSdk = 34
        versionCode = 5949
        versionName = "1.4.2"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables.useSupportLibrary = true
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"),
                          "proguard-rules.pro")
            signingConfig = signingConfigs.getByName("debug")
            buildConfigField("String", "BACKEND_URLS",
                "\"${localProperties.getProperty("BACKEND_URLS_RELEASE", "")}\"")
            buildConfigField("boolean", "CONCURRENT_REQUEST_ENABLED", "false")
        }
        debug {
            buildConfigField("String", "BACKEND_URLS",
                "\"${localProperties.getProperty("BACKEND_URLS_DEBUG", "")}\"")
            buildConfigField("boolean", "CONCURRENT_REQUEST_ENABLED", "false")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
    buildFeatures {
        compose = true
        buildConfig = true
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.3" // 与 Kotlin 1.9.10 配套
    }
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
            pickFirsts += listOf(
                "META-INF/LICENSE-LGPL-3.txt",
                "META-INF/DEPENDENCIES",
                "META-INF/LICENSE-LGPL-2.1.txt",
                "META-INF/LICENSE-W3C-TEST"
            )
        }
    }
}

dependencies {
    // 最后一组支持 minSdk 21 的 Compose BOM
    implementation(platform("androidx.compose:compose-bom:2023.06.01"))
    androidTestImplementation(platform("androidx.compose:compose-bom:2023.06.01"))

    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.compose.material:material")
    implementation("androidx.compose.material:material-icons-core")
    implementation("androidx.compose.material:material-icons-extended")
    debugImplementation("androidx.compose.ui:ui-tooling")

    implementation("androidx.activity:activity-compose:1.7.2")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.6.2")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.6.2")
    implementation("androidx.lifecycle:lifecycle-process:2.6.2")

    implementation("androidx.core:core-ktx:1.10.1")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.9.0")

    // Kotlin 1.9 系列
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.0")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")

    // Ktor 2.3.2 最后一组支持 Java 8
    implementation("io.ktor:ktor-client-core:2.3.2")
    implementation("io.ktor:ktor-client-okhttp:2.3.2")
    implementation("io.ktor:ktor-client-content-negotiation:2.3.2")
    implementation("io.ktor:ktor-serialization-kotlinx-json:2.3.2")
    implementation("io.ktor:ktor-client-logging:2.3.2")

    // Navigation Compose 2.6.0 支持 21
    implementation("androidx.navigation:navigation-compose:2.6.0")

    // 图片加载 Coil 2.4.0 支持 21
    implementation("io.coil-kt:coil-compose:2.4.0")
    implementation("io.coil-kt:coil-video:2.4.0")

    // Markdown 渲染
    implementation("com.github.jeziellago:compose-markdown:0.5.7")

    // 其余工具库
    implementation("org.jsoup:jsoup:1.16.2")
    implementation("com.google.code.gson:gson:2.10.1")
    implementation("com.squareup.okhttp3:okhttp:4.11.0") // 与 Ktor 共用
    implementation("org.slf4j:slf4j-nop:2.0.7")

    // Benchmark / ProfileInstaller 可选
    implementation("androidx.profileinstaller:profileinstaller:1.3.1")

    // Testing
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}
