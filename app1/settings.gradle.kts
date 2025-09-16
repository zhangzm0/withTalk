// settings.gradle.kts
pluginManagement {
    repositories {
        gradlePluginPortal() // ① 必须最先，KSP 只在这里注册
        google()             // ② Android 官方插件
        mavenCentral()       // ③ 中央仓库
        // 下面两个阿里云镜像只做依赖包加速，不能解析插件
        maven { url = uri("https://maven.aliyun.com/repository/public") }
        maven { url = uri("https://maven.aliyun.com/repository/google") }
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
        maven { url = uri("https://maven.pkg.jetbrains.space/public/p/compose/dev") }
        // 阿里云镜像继续留作依赖加速
        maven { url = uri("https://maven.aliyun.com/repository/public") }
        maven { url = uri("https://maven.aliyun.com/repository/google") }
    }
}

include(":app")
