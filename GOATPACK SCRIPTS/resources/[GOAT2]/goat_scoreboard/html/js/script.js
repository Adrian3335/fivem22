$(function () {
  window.addEventListener(
    "message",
    function (event) {
      switch (event.data.action) {
        case "updateJob":
          $("#job").html(event.data.praca);
          break;
        case "toggle":
          if (event.data.state == true) {
            $(".scoreboard").addClass("open");
          } else {
            $(".scoreboard").removeClass("open");
          }
          break;
        case "close":
          $(".scoreboard").removeClass("open");
          break;
        case "updatePlayerJobs":
          var jobs = event.data.jobs;
          $("#players").html(jobs.players + "/128");
          $("#ems").html(jobs.ambulance);
          $("#police").html(jobs.police);
          $("#mechanic").html(jobs.mechanic);
          $("#doj").html(jobs.doj);
          $("#lssd").html(jobs.lssd);
          $("#admins").html(jobs.admins);
          break;
        case "updateCode":
          let codes = {
            ["green"]: "Zielony",
            ["orange"]: "Pomarańczowy",
            ["red"]: "Czerwony",
            ["black"]: "Czarny",
          }
          $("#code").html(codes[event.data.code]);
          $(".code").attr("class", `code ${event.data.code}`);
          break;
        default:
          break;
      }
    },
    false
  );
});
