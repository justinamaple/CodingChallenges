# Source:
#   https://leetcode.com/problems/implement-stack-using-queues

class MyStack

  =begin
      Initialize your data structure here.
  =end
      def initialize()
        @queue = []
      end
  
  
  =begin
      Push element x onto stack.
      :type x: Integer
      :rtype: Void
  =end
      def push(x)
        @queue << x
      end
  
  
  =begin
      Removes the element on top of the stack and returns that element.
      :rtype: Integer
  =end
      def pop()
        reverse = []
        last = nil
  
        # Move all elements except last to reverse list
        (@queue.size - 1).times do
          reverse << @queue.shift
        end
        
        # Store the last element to return, removing it
        last = @queue.shift
        
        # Flip the reverse back to forward
        until reverse.empty?
          @queue << reverse.shift
        end
        
        last
      end
  
  
  =begin
      Get the top element.
      :rtype: Integer
  =end
      def top()
        reverse = []
        last = nil
  
        # Move all elements except last to reverse list
        # Update last to be last added
        until @queue.empty? do
          last =  @queue.shift
          reverse << last
        end
    
        # Flip the reverse back to forward
        until reverse.empty?
          @queue << reverse.shift
        end
        
        last
      end
  
  
  =begin
      Returns whether the stack is empty.
      :rtype: Boolean
  =end
      def empty()
        @queue.empty?
      end
  
  
  end
  
  # Your MyStack object will be instantiated and called as such:
  # obj = MyStack.new()
  # obj.push(x)
  # param_2 = obj.pop()
  # param_3 = obj.top()
  # param_4 = obj.empty()