### A request is slow, how do I figure what is slow through our logs?

Demo how we can use HAProxy logs, Nginx Logs, Unicorn logs to figure out what is slow.

## A request is slow, what can I do about it?

### rack-mini-profiler

How do you use it and what information can you get from it?

### Understanding Flamegraphs

What is a call-stack?
What is a flamegraph?
How do I read a flamegraph?

Example: 001-flamegraph.rb

### How do I get the Flamegraph for a GET request on a customer's site?

1. Make yourself a developer on the site
2. Use `?pp=flamegraph` to view the flamegraph for a request

### Exercise

The `/latest` page is very slow, can you figure out why?

