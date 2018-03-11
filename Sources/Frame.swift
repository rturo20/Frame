//
//  Frame.swift
//
//  Created by Dan Labbad on 10/02/2018.
//  Copyright © 2018 Dan Labbad. All rights reserved.
//

import Foundation
import OpenGL3
import GLGraphics

#if os(OSX)
  import OpenGL
#endif

public protocol Graphics {
  func drawGraphics()
}

public struct Frame {

  public var delegate: Graphics?
  
  public let width: Int32
  public let height: Int32
  public let windowHeader: String 

  public init(width: Int32, height: Int32, windowHeader: String) {
	self.width = width
	self.height = height
	self.windowHeader = windowHeader
  }

  public func initialiseWindow() {
      // Initialize GLFW
      if(glfwInit() == 0) {
        print("Failed to initialize GLFW! I'm out!")
        exit(-1)
      }

  guard let window = glfwCreateWindow(width, height, windowHeader, nil, nil)
    else {
      print("Failed to open a window! I'm out!")
      glfwTerminate()
      exit(-1)
  }

  // Set the window context current
  glfwMakeContextCurrent(window)

  
  // Print the OpenGL version currently enabled on your machine
  let version = String(cString: glGetString(UInt32(GL_VERSION)))
  print(version)

  // Use red to clear the screen
  glClearColor(0, 0, 0, 1)

    
   func setKeyCallback(window: Optional<OpaquePointer>, key: Int32, scanmode: Int32, action: Int32, mods: Int32)  {
		//if (key == GLFW_KEY_E && action == GLFW_PRESS) {
			//print("E")
			//}	
		
		switch key {
		case GLFW_KEY_E:
			print("E")
		default:
			print("Default")
		}
		
	}


  while (glfwWindowShouldClose(window) == 0) {
  
	let time = glfwGetTime()		
	guard time < 10.0 else { 
		glfwWindowShouldClose(window) == 1
		return
	}
	
    // Clear the screen (window background)
    glClear(UInt32(GL_COLOR_BUFFER_BIT))

    delegate?.drawGraphics()
    // print(time)
  
    // Swap front and back buffers for the current window
    glfwSwapBuffers(window)
  
    // Poll for events
    glfwPollEvents()
    
    glfwSetKeyCallback(window, setKeyCallback)
  
	
	if glfwGetKey(window, GLFW_KEY_Q) == 1 {
		print("quit")
		break
	} 


	if glfwGetKey(window, GLFW_KEY_V) == 1 {
                print("V")
        }

	if glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_1) == 1 {
                print("Mouse Clicked!")
        }
  }
  


  // Destroy the window and its context.

  defer {
    glfwDestroyWindow(window)
    glfwTerminate()
  }

}
}


