#include <pistache/endpoint.h>
#include "inc/MinMax.h"

using namespace Pistache;

struct HelloHandler : public Http::Handler {
  HTTP_PROTOTYPE(HelloHandler)
  void onRequest(const Http::Request&, Http::ResponseWriter writer) override{
    writer.send(Http::Code::Ok, "Hello, World!");
  }
};

int main() {
  Http::listenAndServe<HelloHandler>("*:9080");
}