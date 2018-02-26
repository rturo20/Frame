// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Frame",
    dependencies: [
	.Package(url: "https://github.com/pelmasri/OpenGL3.git", majorVersion: 5),
	.Package(url: "https://github.com/pelmasri/GLGraphics.git", majorVersion: 3)

])
