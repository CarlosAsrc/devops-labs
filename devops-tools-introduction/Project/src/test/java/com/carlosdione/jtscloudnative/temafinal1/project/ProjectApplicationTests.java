package com.carlosdione.jtscloudnative.temafinal1.project;

import org.junit.Assert;
import org.junit.Test;

public class ProjectApplicationTests {

    @Test
    public void test() {
        AppServlet app = new AppServlet();
        Assert.assertEquals("works!", app.getMessage());
    }
}
