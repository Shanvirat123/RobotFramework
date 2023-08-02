import os
from sikuli import Screen, Pattern

def verify_image(image_name):
    try:
        image_path = os.path.join(os.getcwd(), "sikuliupload", image_name)
        screen = Screen()
        image_pattern = Pattern(image_path)

        if screen.exists(image_pattern):
            print("Image is present:", image_name)
        else:
            print("Image is not present:", image_name)
            raise Exception(image_name + ": Not available in Application")

    except Exception as e:
        print("Failed to verify image:", image_name)
        print(e)
        raise Exception("Failed to verify image: " + image_name + ", " + str(e))

# Usage example:
verify_image("example.png")
