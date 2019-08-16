#include <gtest/gtest.h>
#include "MinMax.h"

TEST(TestMin, test_min_first) {
    ASSERT_EQ(3, min(3, 5));
}

TEST(TestMin, test_min_second) {
    ASSERT_EQ(-1, min(3, -1));
}

TEST(TestMin, test_equal_value) {
    ASSERT_EQ(3, min(3, 3));
}

TEST(TestMax, test_max_first) {
    ASSERT_EQ(5, max(5, 3));
}

TEST(TestMax, test_min_second) {
    ASSERT_EQ(3, max(-1, 3));
}

TEST(TestMax, test_equal_value) {
    ASSERT_EQ(3, max(3, 3));
}
