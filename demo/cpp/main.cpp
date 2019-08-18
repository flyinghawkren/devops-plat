#include "inc/MinMax.h"

#include <pistache/endpoint.h>

using namespace Pistache;

struct HelloHandler : public Http::Handler {
    HTTP_PROTOTYPE(HelloHandler)

    void onRequest(const Http::Request& req, Http::ResponseWriter writer) override {
        writer.send(Http::Code::Ok, "Hello, World! v1.0.0");
    }
};

int main() {
    HTTP_PROTOTYPE::listenAndServe<HelloHandler>("*:9080");
}