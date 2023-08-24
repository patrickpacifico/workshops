package com.myorg;

import software.constructs.Construct;
import software.amazon.awscdk.Stack;
import software.amazon.awscdk.StackProps;
import software.amazon.awscdk.Duration;
import software.amazon.awscdk.services.sqs.Queue;
import software.amazon.awscdk.services.s3.*;
import software.amazon.awscdk.services.sns.*;

public class JavaCdkExemploStack extends Stack {
    public JavaCdkExemploStack(final Construct scope, final String id) {
        this(scope, id, null);
    }

    public JavaCdkExemploStack(final Construct scope, final String id, final StackProps props) {
        super(scope, id, props);

        // The code that defines your stack goes here
        new Queue(this, "QueueTesteDio");
        // example resource
        final Queue queue = Queue.Builder.create(this, "JavaCdkExemploQueue")
                .visibilityTimeout(Duration.seconds(300))
                .build();

        final Bucket bucket = Bucket.Builder.create(this, "JavaCdkExemploBucket")
                .build();

        final Topic topic = Topic.Builder.create(this, "Topic")
                .displayName("Customer subscription topic")
                .build();
    }
}
