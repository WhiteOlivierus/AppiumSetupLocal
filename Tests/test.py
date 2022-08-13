import os
import unittest
from appium import webdriver
from selenium.webdriver.common.by.By import AppiumBy
from time import sleep

class ChessAndroidTests(unittest.TestCase):
    def setUp(self):
        desired_caps = {}
        desired_caps['platformName'] = 'Android'
        desired_caps['platformVersion'] = '12.0'
        desired_caps['deviceName'] = 'Pixel 4a API 31'
        # Returns abs path relative to this file and not cwd
        desired_caps['app'] = os.path.abspath(os.path.join(os.path.dirname(__file__),'app-debug.apk'))
        desired_caps['appPackage'] = 'com.example.appiumtestapp'
        desired_caps['appActivity'] = '.MainActivity'
        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)

    def tearDown(self):
        self.driver.quit()

    def test_single_player_mode(self):
        sleep(5)
        element = self.driver.find_element(by=AppiumBy.ID, value="com.example.appiumtestapp:id/button_first")
        element.click()
        sleep(5)

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(ChessAndroidTests)
    unittest.TextTestRunner(verbosity=2).run(suite)