# java
override[:java][:install_flavor] = "openjdk"
override[:java][:jdk_version] = "7"

if platform?("ubuntu", "debian")
  override[:java][:openjdk_packages] = ["openjdk-7-jdk", "openjdk-7-jre-headless"]
end

if platform?("redhat", "centos")
  override[:java][:openjdk_packages] = ["java-1.7.0-openjdk", "java-1.7.0-openjdk-devel"]
end