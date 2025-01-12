import random

def maxSum(nums, k):
    n = len(nums)
    max_sum = float('-inf')
    
    # Try rotating each subarray of size k
    for i in range(n - k + 1):
        # Create a copy of the array
        rotated_nums = nums[:]
        
        # Rotate the subarray nums[i:i+k] by one position to the right
        rotated_nums[i:i+k] = [rotated_nums[i+k-1]] + rotated_nums[i:i+k-1]
        
        # Find the maximum sum of subarray of size k in the rotated array
        for j in range(n - k + 1):
            current_sum = sum(rotated_nums[j:j+k])
            max_sum = max(max_sum, current_sum)
    
    return max_sum




def generate_test_cases():
    test_cases = []
    num1 = [1, 3, -1, 2, 5, 1]
    k1 = 3
    testCase1 = (num1, k1, maxSum(num1, k1))

    num2 = [1, 2, 3, 4, 5] 
    k2 = 2
    testCase2 = (num2, k2, maxSum(num2, k2))

   
    test_cases.append(testCase1)
    test_cases.append(testCase2)


    for _ in range(100):
        # Randomly determine the size of the array
        n = random.randint(2, 20)  # Reduced size for better readability

        # Generate the array with random values within the range [-10^4, 10^4]
        nums = [random.randint(-10000, 10000) for _ in range(n)]

        # Randomly select k (1 <= k <= n)
        k = random.randint(1, n)

        # Calculate the answer using the solution function
        answer = maxSum(nums, k)

        # Append the test case as a tuple (nums, k, answer)
        test_cases.append((nums, k, answer))

    return test_cases

# Generate the test cases
test_cases = generate_test_cases()

# Save the test cases and answers to a file
with open("test_cases_with_answers.txt", "w") as file:
    for i, (nums, k, answer) in enumerate(test_cases):
        file.write(f"Test Case {i + 1}:\n")
        file.write("Input:\n")
        file.write(f"nums = {nums}\n")
        file.write(f"k = {k}\n")
        file.write("Output:\n")
        file.write(f"{answer}\n\n")

print("100 test cases with answers have been generated and saved to 'test_cases_with_answers.txt'.")
